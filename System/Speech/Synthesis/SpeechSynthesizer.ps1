using assembly System.Speech

$synth = new-object -typeName System.Speech.Synthesis.SpeechSynthesizer

$synth.Speak('Hello world')
