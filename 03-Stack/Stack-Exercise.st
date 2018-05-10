!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'sd 4/25/2018 15:18:02'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'sd 4/25/2018 15:25:46'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'sd 4/25/2018 15:36:18'!
test04PopReturnsLastPushedObject

	| stack pushedObject|
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.

	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #EmptyStackElement category: #'Stack-Exercise'!
Object subclass: #EmptyStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 16:25:42'!
actualValue
		^self error:OOStack stackEmptyErrorDescription
	! !

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 14:47:00'!
emptyElement
	^ true.! !

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 16:24:32'!
previous
		^self error:OOStack stackEmptyErrorDescription
! !

!EmptyStackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:39:19'!
size
	^0! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:37:33'!
initialize
	topElement _ EmptyStackElement new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:37:30'!
isEmpty
	^topElement emptyElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:37:11'!
pop
	 |oldTop|
	 oldTop := topElement.
	 topElement := oldTop previous.
	^oldTop actualValue.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:37:24'!
push: anElement
	topElement _ StackElement new initializeWith: anElement withPrevious: topElement! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:39:07'!
size
	^topElement size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:38:27'!
top
	^topElement actualValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #StackElement category: #'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:35:52'!
actualValue
	^value! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 14:47:42'!
emptyElement
	^ false.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:40:19'!
initializeWith: aValue withPrevious: anotherElement
	 previousElement := anotherElement.
	 value := aValue! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:40:25'!
previous
	^previousElement.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'sd 4/25/2018 15:39:55'!
size
	^ (1+previousElement size).! !
