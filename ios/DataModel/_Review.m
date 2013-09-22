// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.m instead.

#import "_Review.h"

const struct ReviewAttributes ReviewAttributes = {
	.comment = @"comment",
	.customerreview = @"customerreview",
	.rating = @"rating",
	.reviewdate = @"reviewdate",
	.reviewerid = @"reviewerid",
	.userid = @"userid",
};

const struct ReviewRelationships ReviewRelationships = {
	.user = @"user",
};

const struct ReviewFetchedProperties ReviewFetchedProperties = {
};

@implementation ReviewID
@end

@implementation _Review

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Review" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Review";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Review" inManagedObjectContext:moc_];
}

- (ReviewID*)objectID {
	return (ReviewID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"customerreviewValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"customerreview"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"revieweridValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"reviewerid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"useridValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic comment;






@dynamic customerreview;



- (int64_t)customerreviewValue {
	NSNumber *result = [self customerreview];
	return [result longLongValue];
}

- (void)setCustomerreviewValue:(int64_t)value_ {
	[self setCustomerreview:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveCustomerreviewValue {
	NSNumber *result = [self primitiveCustomerreview];
	return [result longLongValue];
}

- (void)setPrimitiveCustomerreviewValue:(int64_t)value_ {
	[self setPrimitiveCustomerreview:[NSNumber numberWithLongLong:value_]];
}





@dynamic rating;



- (int64_t)ratingValue {
	NSNumber *result = [self rating];
	return [result longLongValue];
}

- (void)setRatingValue:(int64_t)value_ {
	[self setRating:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result longLongValue];
}

- (void)setPrimitiveRatingValue:(int64_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithLongLong:value_]];
}





@dynamic reviewdate;






@dynamic reviewerid;



- (int64_t)revieweridValue {
	NSNumber *result = [self reviewerid];
	return [result longLongValue];
}

- (void)setRevieweridValue:(int64_t)value_ {
	[self setReviewerid:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveRevieweridValue {
	NSNumber *result = [self primitiveReviewerid];
	return [result longLongValue];
}

- (void)setPrimitiveRevieweridValue:(int64_t)value_ {
	[self setPrimitiveReviewerid:[NSNumber numberWithLongLong:value_]];
}





@dynamic userid;



- (int64_t)useridValue {
	NSNumber *result = [self userid];
	return [result longLongValue];
}

- (void)setUseridValue:(int64_t)value_ {
	[self setUserid:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveUseridValue {
	NSNumber *result = [self primitiveUserid];
	return [result longLongValue];
}

- (void)setPrimitiveUseridValue:(int64_t)value_ {
	[self setPrimitiveUserid:[NSNumber numberWithLongLong:value_]];
}





@dynamic user;

	






@end
