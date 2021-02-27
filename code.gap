LoadPackage("fining");      
LoadPackage("guava");   

e := 2; 
h := 3; 
    
space := PG(3, 2^h);
field := GF(2^h);   
Pinf := VectorSpaceToElement(space, [0,0,0,1] * Z(2^h));
A := List(GF(2^h),t->VectorSpaceToElement(space,[Z(2^h)^0,t,t^(2^e),t^(2^e + 1)]));
Glynnarc := Union(A,[Pinf]);
hyperplanes := List(Hyperplanes(space),H->Size(Filtered(Glynnarc,P->P in H)));
stats := Collected(hyperplanes);
genMatrix := TransposedMat(List(A, p -> Coordinates(p)));   
#pts := List(UnderlyingVectorSpace(space));      

C := GeneratorMatCode(genMatrix, "MDS code", field);    

#code := pts * genMatrix;    

