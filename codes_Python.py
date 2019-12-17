from music21 import *

def getPitches(array):
    rest=[]
    chord=[]
    pitch=[]
    if(len(array)==3):
        pitch=int(array[1])+59
        result = {
          'A': ['note','rest','rest'],
          'B': ['note','rest','note'],
          'C': ['note','note','rest'],
          'D': ['note','note','note'],
          'E': ['rest','note','rest'],
          'F': ['rest','rest','note'],
          'G': ['rest','note','note'],
        }[array[0]]
        rest=result
        result2 = {
          'I': lambda x: ['C4','E4','G4'],
          'II': lambda x: ['D4','F4','A5'],
          'III': lambda x: ['E4','G4','B5'],
          'IV': lambda x: ['F4','A5','C5'],
          'V': lambda x: ['G4','B5','D5'],
          'VI': lambda x: ['A5','C5','E5'],
          'VII': lambda x: ['B5','D5','F5'],
        }[array[2]](chord)
        chord=result2
#     print(rest,chord,pitch)
    return (rest,chord,pitch)

def getData(test):
    composition=stream.Score()
    s1 = stream.Part() 
    s1.insert(instrument.Piano())
    s1.timeSignature = meter.TimeSignature('3/8')
    s1.insert(tempo.MetronomeMark(0,120.0))
    s1.clef = clef.BassClef()
    s2=stream.Part()
    s2.insert(instrument.Piano())
    s2.timeSignature = meter.TimeSignature('3/8')
    s2.insert(tempo.MetronomeMark(0,120.0))
    s2.clef = clef.BassClef()

    
    parseText=[]
    f=open(test,'r')
    for x in f:
        parseText.append(x.split())
    chords=[]
    for i in parseText:
        (rest,chord,pitch)=getPitches(i)
        chords.append(chord)
        if(rest[0]=='note'):
            n=note.Note()
            n.pitch.midi=pitch
        else:
            n=note.Rest()
        n.duration.quarterLength=0.5
        s1.append(n)
        if(rest[1]=='note'):
            n=note.Note()
            n.pitch.midi=pitch
        else:
            n=note.Rest()
        n.duration.quarterLength=0.5
        s1.append(n)  
        if(rest[2]=='note'):
            n=note.Note()
            n.pitch.midi=pitch
        else:
            n=note.Rest()
        n.duration.quarterLength=0.5
        s1.append(n)  
    
    for i in chords:
        for j in i:
            n=note.Note(j)
            n.duration.quarterLength=0.5
            s2.append(n)
    composition.insert(0,s1)
    composition.insert(0,s2)
    composition.write('midi','final.mid')

getData("/home/gabriel/Downloads/testInput.txt")
