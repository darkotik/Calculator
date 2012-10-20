//
//  ViewController.m
//  Calculatrice
//
//  Created by jb SERVAIS on 25/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize afficheur, operateur, clicOperateur, update, chiffre1;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	chiffre1 = 0;
	operateur = ' ';
	clicOperateur = NO;
	update = NO;
	afficheur.text = @"0";
}


- (void)viewDidUnload
{
    [self setAfficheur:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//Méthode pression d'un chiffre
- (IBAction)boutonNombre:(id)sender {
    if (update) {
		update = NO;
		afficheur.text = [sender currentTitle];
	}
	else {
		if ([afficheur.text compare:@"0"]) {
			afficheur.text = [afficheur.text stringByAppendingString:[sender currentTitle]];
		}
		else {
			afficheur.text = [sender currentTitle];
		}
	}
}

//Méthode pression d'une virgule
- (IBAction)boutonVirgule:(id)sender {
    
    if ([afficheur.text rangeOfString:@"."].location == NSNotFound ) {
		afficheur.text = [afficheur.text stringByAppendingString:@"."];
	}
}

//Méthode pression de +
- (IBAction)boutonPlus:(id)sender {
    
    if (clicOperateur) {
		[self calcul];
	}
	else {
		chiffre1 = [afficheur.text doubleValue];
		clicOperateur = YES;
	}
	operateur = '+';
	update = YES;
}

//Méthode pression de -
- (IBAction)boutonMoins:(id)sender {
    
    if (clicOperateur) {
		[self calcul];
	}
	else {
		chiffre1 = [afficheur.text doubleValue];
		clicOperateur = YES;
	}
	operateur = '-';
	update = YES;
}

//Méthode pression de X
- (IBAction)boutonMulti:(id)sender {
    
    if (clicOperateur) {
		[self calcul];
	}
	else {
		chiffre1 = [afficheur.text doubleValue];
		clicOperateur = YES;
	}
	operateur = '*';
	update = YES;
}

//Méthode pression de /
- (IBAction)boutonDiv:(id)sender {
    
    if (clicOperateur) {
		[self calcul];
	}
	else {
		chiffre1 = [afficheur.text doubleValue];
		clicOperateur = YES;
	}
	operateur = '/';
	update = YES;
}

//Méthode pression du signe egale
- (IBAction)boutonEgal:(id)sender {
    
    [self calcul];
	update = YES;
	clicOperateur = NO;
}

//Méthode correction de la saisie
- (IBAction)boutonC:(id)sender {
    clicOperateur = false;
	update = true;
	chiffre1 = 0;
	operateur = ' ';
	afficheur.text = @"0";
}


// Méthode qui fait le calcul qui a été demandé par l'utilisateur

- (void) calcul {
	if (operateur == '+') {
		chiffre1 = chiffre1 + [afficheur.text doubleValue];
		afficheur.text = [NSString stringWithFormat:@"%g", chiffre1];
	}
    
	if (operateur == '-') {
		chiffre1 = chiffre1 - [afficheur.text doubleValue];
		afficheur.text = [NSString stringWithFormat:@"%g", chiffre1];
	}
    
	if (operateur == '*') {
		chiffre1 = chiffre1 * [afficheur.text doubleValue];
		afficheur.text = [NSString stringWithFormat:@"%g", chiffre1];
	}
    
	if (operateur == '/') {
		chiffre1 = chiffre1 / [afficheur.text doubleValue];
		afficheur.text = [NSString stringWithFormat:@"%g", chiffre1];
	}
}
@end
