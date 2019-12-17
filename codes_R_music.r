hmm1 = initHMM(c("1", "2", "3", "4", "5", "6", "7"), c("I", "II", "III", "IV", "V", "VI", "VII"), 
                c(1,0,0,0,0,0,0), t(matrix(c(.1,.3,.2,.1,.1,.1,.1,
                                           .2,.1,.3,.1,.1,.1,.1,
                                           .1,.2,.1,.3,.1,.1,.1,
                                           .1,.1,.2,.1,.3,.1,.1,
                                           .1,.1,.1,.2,.1,.3,.1,
                                           .1,.1,.1,.1,.2,.1,.3,
                                           .3,.1,.1,.1,.1,.2,.1),7)), 
                                  t(matrix(c(.3,0,.3,0,.3,0,.1,
                                           .1,.3,0,.3,0,.3,0,
                                           0,.1,.3,0,.3,0,.3,
                                           .3,0,.1,.3,0,.3,0,
                                           0,.3,0,.1,.3,0,.3,
                                           .3,0,.3,0,.1,.3,0,
                                           0,.3,0,.3,0,.1,.3),7)))

obs1 = c("III", "II", "III", "IV", "V", "III", "II", "IV", "V", "VII", "VI", "VII", "II", "II", "VI", "II", "VI", "V",
         "I", "III", "IV", "VI", "IV", "I", "III", "VII", "I", "III", "VII", "V", "VII", "I")


hmm2 = initHMM(c("I", "II", "III", "IV", "V", "VI", "VII"), c("1", "2", "3", "4", "5", "6", "7"), 
                c(1,0,0,0,0,0,0), t(matrix(c(.2,.2,.05,.2,.2,.1,.05,
                                              0,.1,.1,.2,.4,.1,.1,
                                              0,0,0,.2,.2,.5,.1,
                                              .1,.2,.0,.1,.5,.0,.1,
                                              .6,0,.05,0,.2,.1,.05,
                                              0,.2,0,.5,.2,.0,.1,
                                              .3,0,0,0,.6,.1,.0),7)), 
                                  t(matrix(c(.3,0,.3,0,.3,0,.1,
                                             .1,.3,0,.3,0,.3,0,
                                             0,.1,.3,0,.3,0,.3,
                                             .3,0,.1,.3,0,.3,0,
                                             0,.3,0,.1,.3,0,.3,
                                             .3,0,.3,0,.1,.3,0,
                                             0,.3,0,.3,0,.1,.3),7)))


obs2 = c("1", "2", "5", "6", "7", "4", "7", "7", "1", "7", "6", "4", "6", "4", "4", "5", "3", "5", 
        "4", "3", "7", "1", "2", "3", "3", "2", "5", "4", "7", "3", "5", "6")


hmm$transProbs[is.na(hmm$transProbs)] = 0
hmm$emissionProbs[is.na(hmm$emissionProbs)] = 0

nObservations = length(observation)
nStates = length(hmm$States)

v = array(NA, c(nStates, nObservations))
dimnames(v) = list(states = hmm$States, index = 1:nObservations)


for (state in hmm$States) {
  v[state, 1] = log(hmm$startProbs[state] * hmm$emissionProbs[state, 
                                                              observation[1]])
}

for (k in 2:nObservations) {
  for (state in hmm$States) {
    maxi = NULL
    for (previousState in hmm$States) {
      temp = v[previousState, k - 1] + log(hmm$transProbs[previousState, 
                                                          state])
      maxi = max(maxi, temp)
    }
    v[state, k] = log(hmm$emissionProbs[state, observation[k]]) + 
      maxi
  }
}

viterbiPath = rep(NA, nObservations)

for (state in hmm$States) {
  if (max(v[, nObservations]) == v[state, nObservations]) {
    viterbiPath[nObservations] = state
    break
  }
}

for (k in (nObservations - 1):1) {
  for (state in hmm$States) {
    if (max(v[, k] + log(hmm$transProbs[, viterbiPath[k + 
                                                      1]])) == v[state, k] + log(hmm$transProbs[state, 
                                                                                                viterbiPath[k + 1]])) {
      viterbiPath[k] = state
      break
    }
  }
}

View(viterbiPath)
