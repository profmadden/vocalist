//
//  ViewController.m
//  vocalist
//
//  Created by Patrick Madden on 9/15/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize audioSession, synth, voice, tf;
@synthesize voices;
@synthesize pitchSlider, rateSlider;
@synthesize voiceTable;
@synthesize voiceNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSError *err;
    audioSession = [AVAudioSession sharedInstance];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&err];
    
    voiceNumber = 0;

    AVSpeechUtterance *ut = [[AVSpeechUtterance alloc] initWithString:@"Hello there this is i o s"];
    
    voice = [AVSpeechSynthesisVoice voiceWithIdentifier:AVSpeechSynthesisVoiceIdentifierAlex];
    [ut setVoice:voice];
    
    synth = [[AVSpeechSynthesizer alloc] init];
    voices = [AVSpeechSynthesisVoice speechVoices];
    
    // [synth speakUtterance:ut];

}

float f = 1.0;

-(IBAction)speakit:(id)sender
{
    AVSpeechUtterance *ut = [[AVSpeechUtterance alloc] initWithString:[tf text]];
    [ut setVoice:voice];
    [ut setPitchMultiplier:f];
    [synth speakUtterance:ut];
}

-(IBAction)pitcher:(id)sender
{
    f = ((float)[pitchSlider value])/1000.0 + 0.5;
    NSLog(@"Set pitch to %f", f);
}

-(IBAction)nextVoice:(id)sender
{
    ++voiceNumber;
    if (voiceNumber >= [voices count])
        voiceNumber = 0;
    voice = [voices objectAtIndex:voiceNumber];
    NSLog(@"Pick voice %d -> %@", voiceNumber, [voice name]);
}



- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance API_AVAILABLE(ios(7.0), watchos(1.0), tvos(7.0), macos(10.14))
{
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    voiceNumber = (int)[indexPath row];
    voice = [voices objectAtIndex:voiceNumber];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [voices count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *c = [[UITableViewCell alloc] init];
    [[c textLabel] setText:[[voices objectAtIndex:[indexPath row]] name]];
    
    return c;
}

@end
