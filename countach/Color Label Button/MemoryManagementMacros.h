//
//  MemoryManagementMacros.h
//  Memory Management Macros
//
//  Created by Tony Arnold on 20/12/06.
//  Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//
//  This code was originally written by Thomas Staller for the VirtueDesktops project.

#define	MMM_ASSIGN(aTarget, aSource)  \
if (aTarget != nil)                   \
[aTarget autorelease];                \
aTarget = [aSource retain];

#define MMM_ASSIGN_COPY(aTarget, aSource)	\
if (aTarget != nil)                       \
[aTarget autorelease];                    \
aTarget = [aSource copy];

#define MMM_RELEASE(aTarget)  \
if (aTarget != nil)           \
{                             \
  [aTarget release];          \
  aTarget = nil;              \
}
