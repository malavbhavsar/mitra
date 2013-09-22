// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.m instead.

#import "_Service.h"

const struct ServiceAttributes ServiceAttributes = {
	.all_day = @"all_day",
	.brief_description = @"brief_description",
	.can_travel = @"can_travel",
	.created_at = @"created_at",
	.fee = @"fee",
	.location = @"location",
	.long_description = @"long_description",
	.max_ppl = @"max_ppl",
	.min_ppl = @"min_ppl",
	.name = @"name",
	.picture_url = @"picture_url",
	.serviceID = @"serviceID",
	.time_from = @"time_from",
	.time_to = @"time_to",
	.userid = @"userid",
};

const struct ServiceRelationships ServiceRelationships = {
	.user = @"user",
};

const struct ServiceFetchedProperties ServiceFetchedProperties = {
};

@implementation ServiceID
@end

@implementation _Service

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Service" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Service";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Service" inManagedObjectContext:moc_];
}

- (ServiceID*)objectID {
	return (ServiceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"all_dayValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"all_day"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"can_travelValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"can_travel"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"feeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fee"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"max_pplValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"max_ppl"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"min_pplValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"min_ppl"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"serviceIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"serviceID"];
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




@dynamic all_day;



- (BOOL)all_dayValue {
	NSNumber *result = [self all_day];
	return [result boolValue];
}

- (void)setAll_dayValue:(BOOL)value_ {
	[self setAll_day:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAll_dayValue {
	NSNumber *result = [self primitiveAll_day];
	return [result boolValue];
}

- (void)setPrimitiveAll_dayValue:(BOOL)value_ {
	[self setPrimitiveAll_day:[NSNumber numberWithBool:value_]];
}





@dynamic brief_description;






@dynamic can_travel;



- (BOOL)can_travelValue {
	NSNumber *result = [self can_travel];
	return [result boolValue];
}

- (void)setCan_travelValue:(BOOL)value_ {
	[self setCan_travel:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCan_travelValue {
	NSNumber *result = [self primitiveCan_travel];
	return [result boolValue];
}

- (void)setPrimitiveCan_travelValue:(BOOL)value_ {
	[self setPrimitiveCan_travel:[NSNumber numberWithBool:value_]];
}





@dynamic created_at;






@dynamic fee;



- (float)feeValue {
	NSNumber *result = [self fee];
	return [result floatValue];
}

- (void)setFeeValue:(float)value_ {
	[self setFee:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveFeeValue {
	NSNumber *result = [self primitiveFee];
	return [result floatValue];
}

- (void)setPrimitiveFeeValue:(float)value_ {
	[self setPrimitiveFee:[NSNumber numberWithFloat:value_]];
}





@dynamic location;






@dynamic long_description;






@dynamic max_ppl;



- (int64_t)max_pplValue {
	NSNumber *result = [self max_ppl];
	return [result longLongValue];
}

- (void)setMax_pplValue:(int64_t)value_ {
	[self setMax_ppl:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveMax_pplValue {
	NSNumber *result = [self primitiveMax_ppl];
	return [result longLongValue];
}

- (void)setPrimitiveMax_pplValue:(int64_t)value_ {
	[self setPrimitiveMax_ppl:[NSNumber numberWithLongLong:value_]];
}





@dynamic min_ppl;



- (int64_t)min_pplValue {
	NSNumber *result = [self min_ppl];
	return [result longLongValue];
}

- (void)setMin_pplValue:(int64_t)value_ {
	[self setMin_ppl:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveMin_pplValue {
	NSNumber *result = [self primitiveMin_ppl];
	return [result longLongValue];
}

- (void)setPrimitiveMin_pplValue:(int64_t)value_ {
	[self setPrimitiveMin_ppl:[NSNumber numberWithLongLong:value_]];
}





@dynamic name;






@dynamic picture_url;






@dynamic serviceID;



- (int16_t)serviceIDValue {
	NSNumber *result = [self serviceID];
	return [result shortValue];
}

- (void)setServiceIDValue:(int16_t)value_ {
	[self setServiceID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveServiceIDValue {
	NSNumber *result = [self primitiveServiceID];
	return [result shortValue];
}

- (void)setPrimitiveServiceIDValue:(int16_t)value_ {
	[self setPrimitiveServiceID:[NSNumber numberWithShort:value_]];
}





@dynamic time_from;






@dynamic time_to;






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
