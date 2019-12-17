
comp = "A"

for (i in 1:31) {
  if (comp[i] == "A"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(4,1,1,2,1,1,0)))
  } else if (comp[i] == "B"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(0,2,2,4,1,1,0)))
  } else if (comp[i] == "C"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(0,2,2,4,1,1,0)))
  } else if (comp[i] == "D"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(1,1,1,5,1,1,0)))
  } else if (comp[i] == "E"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(0,2,2,4,1,1,0)))
  } else if (comp[i] == "F"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(0,2,2,4,1,1,0)))
  } else if (comp[i] == "G"){
    comp = c(comp, sample(c("A", "B", "C", "D", "E", "F", "G"), 1, replace = TRUE, prob = c(0,0,0,0,0,0,0)))
  }
}

comp_f = comp

############# notas

nota= "1"
ritmo = "I"

for (i in 1:31) {
  if (ritmo[i] == "I"){
    ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(2,2,.5,2,2,1,.5)))
    nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(3,0,3,0,3,0,1)))
  
    } else if (ritmo[i] == "II"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(0,1,1,2,4,1,1)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(1,3,0,3,0,3,0)))
  
    } else if (ritmo[i] == "III"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(0,0,0,2,2,5,1)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(0,1,3,0,3,0,3)))
  
    } else if (ritmo[i] == "IV"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(1,2,0,1,2,0,1)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(3,0,1,3,0,3,0)))
  
    } else if (ritmo[i] == "V"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(6,0,.5,0,2,1,.5)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(0,3,0,1,3,0,3)))
  
    } else if (ritmo[i] == "VI"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(0,2,0,5,2,0,1)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(3,0,3,0,1,3,0)))
  
    } else if (ritmo[i] == "VII"){
      ritmo = c(ritmo, sample(c("I", "II", "III", "IV", "V", "VI", "VII"), 1, replace = TRUE, prob = c(3,0,0,0,6,1,0)))
      nota = c(nota, sample(c("1", "2", "3", "4", "5", "6", "7"), 1, replace = TRUE, prob = c(0,3,0,3,0,1,3)))
    }
}

nota

#######################

final = rbind(comp, nota, ritmo)
