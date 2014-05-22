#include "AllTest.h"
/* This file is part of niqlow. Copyright (C) 2011-2013 Christopher Ferrall */

TestRun() {
	println("\n\n***************** Test1 *****************\n");
	Test1::Run(FALSE);	
	println("\n\n***************** Test1 *****************\n");
	Test1::Run(TRUE);	
	println("\n\n***************** Test2 *****************\n");
	Test2::Run(FALSE);	
	println("\n\n***************** Test2 *****************\n");
	Test2::Run(TRUE);	
	println("\n\n***************** Test3 *****************\n");
	Test3::Run(FALSE);	
	println("\n\n***************** Test3 *****************\n");
	Test3::Run(TRUE);	
	println("\n\n***************** Test3a *****************\n");
	Test3a::Run();	
	println("\n\n***************** Test4 *****************\n");
	Test4::Run();		
	println("\n\n***************** Test5 *****************\n");
	Test5::Run();		
	println("\n\n***************** Test6 *****************\n");
	Test6::Run();		
	println("\n\n***************** Test7 *****************\n");
	Test7::Run();		
	println("\n\n***************** Test8 *****************\n");
	Test8::Run();		
	}

Test1::Reachable() { return new Test1(); }
Test1::Utility() { return 1.0; }
Test1::Run(UseList) {
	Bellman::Initialize(Test1::Reachable,UseList,0);
	SetClock(NormalAging,10);
	CreateSpaces();
	decl EMax = new ValueIteration(0);
	EMax -> Solve(0,0);
	DPDebug::outV(TRUE);
	delete EMax;
	Delete();
	}

Test2::Reachable() { return new Test2(); }
Test2::Utility() { return curt < TT-1 ? 1.0 : 0.0; }
Test2::Run(UseList) {
	Initialize(Test2::Reachable,UseList,0);
	SetClock(RandomMortality,10,0.9);
	CreateSpaces();
	decl EMax = new ValueIteration(0);
	EMax -> Solve(0,0);
	delete EMax;
	DPDebug::outV(TRUE);
	Delete();
	}

Test3::Reachable() { return new Test3(); }
Test3::Utility() { decl u = A[Aind]*(CV(d)-5+CV(s0))+(1-A[Aind])*CV(s1); return u;}
Test3::Run(UseList) {
	Initialize(Test3::Reachable,UseList,0);
	SetClock(NormalAging,5);
	Volume = LOUD;
	Actions(new ActionVariable("a",2));
	ExogenousStates(d = new SimpleJump("d",11));
	EndogenousStates(s0 = new SimpleJump("s0",5),s1 = new SimpleJump("s1",5));
	CreateSpaces();
	decl KW = new KeaneWolpin(0.8,0);
	KW->Solve(0,0);
	DPDebug::outV(TRUE);
	delete KW;
	Delete();
	}

Test3a::Run()	{
	decl i, Approx,Brute,AMat,BMat;	
	Initialize(Reachable,TRUE,0);
	SetClock(NormalAging,1);
	Actions(accept = new ActionVariable("Accept",Msectors));
	ExogenousStates(offers = new MVNormal("eps",Msectors,Noffers,zeros(Msectors,1),sig));
	xper = new array[Msectors-1];
	for (i=0;i<Msectors-1;++i)
		EndogenousStates(xper[i] = new SimpleJump("X"+sprint(i),MaxExp));
	SetDelta(0.95);
	CreateSpaces(LogitKernel,0.001);
	Volume = LOUD;
	Brute = new ValueIteration();
	Brute-> Solve();
	DPDebug::outV(FALSE,&BMat);
	Approx = new KeaneWolpin(0.99);
	Approx -> Solve();
	DPDebug::outV(FALSE,&AMat);
    println("difference ","%c",{"EV","Choice Probs"},(BMat-AMat)[][columns(BMat)-4:]);
    Delete();
}

Test3a::Reachable() {return new Test3a(); 	}

/** Utility vector equals the vector of feasible returns.**/	
Test3a::Utility() {
 	decl  xw = xper[white].v/2, xb = xper[blue].v/2,
	 xbw = (1~10~xw~-sqr(xw)~xb~-sqr(xb))*alph[white],
	 xbb = (1~10~xb~-sqr(xb)~xw~-sqr(xw))*alph[blue],
	 eps = selectrc(offers.Grid,accept.vals,offers.v)',
	 R = exp( (xbw | xbb | 9.0) + eps );
	return R;
	}
	
Test4::Reachable() { return new Test4(); }
Test4::Utility() { return 0|-0.5; }
Test4::Run() {
	Initialize(Test4::Reachable,FALSE,0);
	SetIntegration(16,0);
	SetClock(NormalAging,10);
	Actions(new ActionVariable("a",2));
	CreateSpaces();
	decl EMax = new ValueIteration(0);
	EMax -> Solve(0,0);
	delete EMax;
	DPDebug::outV(TRUE);
	Delete();
	}

Test5::Reachable() { return new Test5(); }
Test5::Utility() { return 0|0; }
Test5::Run() {
	Initialize(Test5::Reachable,FALSE,0);
	SetClock(NormalAging,1);
	Actions(new ActionVariable("a",2));
	SetIntegration(100,-1,<1.0;0.99;1.0>);
	CreateSpaces();
	decl EMax = new ValueIteration(0);
	EMax -> Solve(0,0);
	delete EMax;
	DPDebug::outV(TRUE);
	Delete();
	}

Test6::Reachable() { return new Test6(); }
Test6::Utility() { return (job.status.v==3) * job.offer.v * aa(acc) ; }
Test6::Run() {
	Initialize(Test6::Reachable,FALSE,0);
	SetClock(Ergodic);
	Actions(acc = new ActionVariable("a",2));
	EndogenousStates(job = new OfferWithLayoff("",5,acc,0.4,0.2));
	CreateSpaces();
	decl EMax = new ValueIteration(0);
	decl sp = new Panel(0,EMax);
	sp -> Simulate(30,20,0,0);
	DPDebug::outV(TRUE);
	sp -> Print(TRUE);
	Delete();
	}

Test7::Run()  {
	Initialize(Test7::Reachable,FALSE);
	rc = new Positive("RC",dgp[RC]);
	th1 = new Simplex("q",dgp[XT]);
//	th1->Encode();
    EndogenousStates(x = new Renewal("x",NX,d,th1) );
	StorePalpha();	
  	CreateSpaces();
	SetDelta(0.99);	
	decl EMax = new ValueIteration(0);
	EMax -> Solve(0,0);
	Volume=SILENT;
	data = new DataSet(0,EMax);
	data -> Simulate(300,3,0,0);
	decl g=SetGroup(0);
	g->StationaryDistribution();
	println(g.Pinfinity,g.Palpha);

//	data -> Print(TRUE);
//	data -> Observed(x,UseLabel,d,UseLabel);
//	decl mle = new PanelBB("ZurcherMLE",data,rc,th1);
////	mle.Volume = NOISY;
//	decl nm = new NelderMead(mle);
//	nm.Volume=NOISY;
//	nm->Iterate(0);
//	delete EMax, mle, nm;
	Delete();
	}
	
Test7::Reachable()    { return new Test7(); }
Test7::Utility()  {
	decl ii = aa(d), u = -(ii*CV(rc) + (1-ii)*0.2*CV(x));
//	if (CV(x)==0) println("RC ",CV(rc),CV(x.Pi)');
    return u;
	}

Test8::Reachable() { return new Test8(); }
Test8::Utility() {
	decl dg = CV(g), a = aa(d);
	return dg*a + (1-dg)*(1-a) + 3*CV(r);
	}
Test8::Run() {
	Initialize(Reachable,FALSE,FALSE);
	SetClock(StaticProgram);
	Actions(d = new ActionVariable("d",2));
	GroupVariables(r = new RandomEffect("r",2),
				   g = new FixedEffect("g",2));
	CreateSpaces();
	decl m = new ValueIteration(0);
	m -> Solve(0,0);
	DPDebug::outV(TRUE);
	m -> Solve(1,0);
	DPDebug::outV(TRUE);
    Delete();
	}