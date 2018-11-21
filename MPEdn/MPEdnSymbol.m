/*
 *  MPEdn: An EDN (extensible data notation) I/O library for OS X and
 *  iOS. See https://github.com/scramjet/mpedn and
 *  https://github.com/edn-format/edn.
 *
 *  Copyright (c) 2013 Matthew Phillips <m@mattp.name>
 *
 *  The use and distribution terms for this software are covered by
 *  the Eclipse Public License 1.0
 *  (http://opensource.org/licenses/eclipse-1.0.php). By using this
 *  software in any fashion, you are agreeing to be bound by the terms
 *  of this license.
 *
 * You must not remove this notice, or any other, from this software.
 */
#import "MPEdnSymbol.h"

@implementation MPEdnSymbol

+ (MPEdnSymbol *) symbolWithName: (NSString *) name
{
  return [[MPEdnSymbol alloc] initWithName: name];
}

- (id) initWithName: (NSString *) initName
{
  if (self = [super init])
  {
    name = initName;
  }
  
  return self;
}

- (instancetype) initWithCoder: (NSCoder *) coder
{
  return [[MPEdnSymbol alloc] initWithName: [coder decodeObjectForKey: @"name"]];
}

- (void) encodeWithCoder: (NSCoder *) coder
{
  [coder encodeObject: name forKey: @"name"];
}

- (id) copyWithZone: (NSZone *) zone
{
  return self;
}

- (NSString *) name
{
  return name;
}

- (NSString *) ednName
{
  return name;
}

- (NSString *) stringValue
{
  return name;
}

- (BOOL) isEqual: (id) object
{
  return [object isKindOfClass: [MPEdnSymbol class]] &&
         [[object name] isEqualToString: name];
}

- (NSUInteger) hash
{
  return [name hash];
}

- (NSString *) description
{
  return [NSString stringWithFormat: @"Symbol: %@", name];
}

@end
