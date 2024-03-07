//
//  ViewController.h
//  vocalist
//
//  Created by Patrick Madden on 9/15/22.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

@interface ViewController : UIViewController<AVSpeechSynthesizerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVSpeechSynthesizer *synth;
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;
@property (nonatomic, strong) NSArray<AVSpeechSynthesisVoice *> *voices;
@property (nonatomic, strong) IBOutlet UITextField *tf;
@property (nonatomic, strong) IBOutlet UISlider *pitchSlider, *rateSlider;
@property (nonatomic, strong) IBOutlet UITableView *voiceTable;
@property (nonatomic) int voiceNumber;
@end

