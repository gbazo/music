library(HMM)

hmm = initHMM(c("V", "N"), c("A", "O"), c(0.1, 0.9), matrix(c(0.95,0.3,0.05,0.7),2), matrix(c(0.1,0.5,0.9,0.5),2))

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
