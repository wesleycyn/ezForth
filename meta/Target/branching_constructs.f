IN-META

( Define meta branching constructs )
fload meta/Traget/branching_constructs     -CONDITION.f
fload meta/Traget/branching_constructs     _gt;MARK.f   
fload meta/Traget/branching_constructs     _gt;RESOLVE.f
fload meta/Traget/branching_constructs     _lt;MARK.f   
fload meta/Traget/branching_constructs     _lt;RESOLVE.f
( Meta compiler forward reference linking )

VARIABLE FORWARD-LINK    0 FORWARD-LINK !

fload meta/Traget/forward_reference_linking/MAKE-CODE.f
fload meta/Traget/forward_reference_linking/LINK-BACKWARDS.f    
fload meta/Traget/forward_reference_linking/RESOLVED_.f
fload meta/Traget/forward_reference_linking/DO-FORWARD.f
fload meta/Traget/forward_reference_linking/(FORWARD).f    
fload meta/Traget/forward_reference_linking/FORWARD_.f    
fload meta/Traget/forward_reference_linking/UNDEFINED.f     
