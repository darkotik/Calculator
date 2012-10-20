//
//  ViewController.h
//  Calculatrice
//
//  Created by jb SERVAIS on 25/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

//afficheur
IBOutlet UILabel *afficheur;
    
    double chiffre1;
    char operateur;
    bool update;
    bool clicOperateur;

    
}

@property (nonatomic,retain) UILabel *afficheur;
@property(readwrite) double chiffre1;
@property(readwrite) char  operateur;
@property(readwrite) bool  update;
@property(readwrite) bool  clicOperateur;


//Chiffres et virgule

- (IBAction)boutonNombre:(id)sender;
- (IBAction)boutonVirgule:(id)sender;

//Opérateurs mathématiques

- (IBAction)boutonPlus:(id)sender;
- (IBAction)boutonMoins:(id)sender;
- (IBAction)boutonMulti:(id)sender;
- (IBAction)boutonDiv:(id)sender;

//Calcul
- (IBAction)boutonEgal:(id)sender;
- (IBAction)boutonC:(id)sender;
- (void) calcul;

@end
