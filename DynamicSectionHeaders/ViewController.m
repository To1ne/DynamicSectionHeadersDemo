//
//  ViewController.m
//  DynamicSectionHeaders
//
//  Created by Toon Claes on 01/12/15.
//  Copyright © 2015 Toon Claes. All rights reserved.
//

#import "ViewController.h"

#define kCellIdentifier @"Cell"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];

  self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
  self.tableView.estimatedSectionHeaderHeight = 22.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 10.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return section % 3 + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
  cell.backgroundColor = [UIColor blueColor];
  cell.textLabel.textColor = [UIColor greenColor];
  cell.textLabel.text = @"I am a cell";
  return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  UITableViewCell *header = [UITableViewCell new];
  header.textLabel.numberOfLines = 0;
  header.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
  header.backgroundColor = [UIColor redColor];
  header.textLabel.textColor = [UIColor yellowColor];
  switch (section) {
    case 9:
    case 5:
    case 0:
      header.textLabel.text = @"short";
      break;
    case 4:
    case 1:
      header.textLabel.text = @"a little bit longer";
      break;
    case 7:
    case 2:
      header.textLabel.text = @"very long and will never fit on one line because it's just too long";
      break;
    case 8:
    case 6:
    case 3:
      header.textLabel.text = @"also very long and might be even longer than the very long one that will never fit on one line because it's just too long";
      break;
  }
  return header;
}

@end
