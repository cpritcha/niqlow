Ox0700                             $ox$info        $ox$end    $ox$literals                        Shared      ActionVariable.ox      a    $ox$end    $ox$symbols t       d          d         d         d         d         d         d         d  @       d          d         d         d  ����    d          d         d         d         d  -DT�!	@    d  -DT�!@    d  -DT�!�?    d  ���m0_�?    d  '��@    d  iW�
�@    d  �o��x�?    d        �    d        �    d        �    d        ��    d         d        �<    d  5       d  �������    d            d  ���    d  �      d  >���    d  �      d  ����    d  4      d  ���    d        ��    d  ����    d  ����    d  ����    d  ����    d  ����    d  ����    d  ����    d  ����    d  ����    d  ����    d          d         d         d  ����    d          d         d         d         d          d         d         d         d         d         d         d         d         d  	       d  
       d  
         Infinite Horizon       Ergodic       Normal Finite Horizon Aging    '   Static Program (finite horizon and T=1)    K   Random Aging (finite horizon but aging happens with probability<1 at some t    X   Random Mortaility (finite horizon with probability of early transition to last t, death)    J   Uncertain Longevity (finite horizon until last period which ends randomly)       Regime Change       Social Experiment       User Defined Clock     d          d         d         d          d         d         d         d         d         d         d          d         d         d         d          d         d         d          d         d         d         d           sample size       mean       st.dev.       min       max     d  :�0�yE>    d  :�0�yE>    d  �h㈵��>    d  -C��6?
   Zauxiliary        ����       Discretized       �  
   Zauxiliary    nodes $	        N  	        lt  	        av  	        m  	        z  	        ff  	        nxtp  	        nxtf  	        i  	        indx  	        np  	        pts  	        f  	        p  	           Approx 0           cc  $Approx           this       $t0       x       trans       Discretized 0           cc $Discretized           this       $t0       nodes       Quantity       ����   L $	        pos  	        v  	            Discrete       �     Quantity    L $	        pos  	        v  	        vals $	        N  	        actual  	        pdf  	           Discrete 0           cc  $Discrete           this       $t0       L       N       PDF 0           cc$PDF           this       $t0       Update 0        	   cc$Update           this       $t0    	   Parameter       �     Quantity    L $	        pos  	        v  	        NearFlat $ -C��6?   sep $         DoNotConstrain          ival $	     	   DoNotVary  	        f  	        block  	        start  	        scale  	           Decode 0        
   cc $Decode           this       $t0       f       Encode 0        	   cc$Encode           this       $t0    	   Parameter 0           cc  $Parameter           this       $t0       L       ival       Reset 0        
   cc  $Reset           this       $t0       newv       IsCode       ToggleDoNotVary 0           cc$ToggleDoNotVary           this       $t0       Integration        �  
   Zauxiliary        GaussianQuadrature        �     Integration        GQL       �     GaussianQuadrature    nodes          wght          
   Initialize 0           cc $Initialize           this       $t0       order       GQH       �     GaussianQuadrature    order          nodes          wght          
   Initialize 0           cc $Initialize           this       $t0       order       coef 0           cc $coef           this       $t0       n       GHK       �     Integration    J $	        M $	        R $	        hR $	        iseed $	        SimJ $	        L  	        u  	        nu  	        pk  	        prob  	           GHK 0        	   cc   $GHK           this       $t0       R       J       iseed       SimDP 0        
   cc  $SimDP           this       $t0       V       Sigma       SimProb 0           cc   $SimProb           this       $t0       j       V       Sigma       Version       �  
   Zauxiliary    MinOxVersion $ �     version $ d      checked             Check 0           cc$Check           this       $t0    	   Equations       �  
   Zauxiliary    rlabels $          lamba       values    L $	        N $	        v  	        J  	        lam  	        	   Equations 0           cc $Equations           this       $t0       LorN       norm 0           cc$norm           this       $t0       penalty 0        
   cc$penalty           this       $t0       print 0           cc$print           this       $t0       Equality       �  	   Equations    rlabels $          lamba       values    L $	        N $	        v  	        J  	        lam  	           Equality 0           cc $Equality           this       $t0       LorN       print 0           cc$print           this       $t0    
   InEquality       �  	   Equations    rlabels $          lamba       values    L $	        N $	        v  	        J  	        lam  	        
   InEquality 0           cc $InEquality           this       $t0       LorN       print 0           cc$print           this       $t0       Point    	   �  
   Zauxiliary    AggType  	        F  	        X  	        V  	        v  	        J  	        G  	        H  	        SE  	           Copy 0           cc $Copy           this       $t0       h       GCopy 0        	   cc $GCopy           this       $t0       h       Point 0           cc$Point           this       $t0    	   aggregate 0           cc  $aggregate           this       $t0       V  @        v  @        SepPoint       �     Point    AggType  	        F  	        X  	        V  	        v  	        J  	        G  	        H  	        SE  	        Kvar $	        bb $	           SepPoint 0           cc  $SepPoint           this       $t0       Kvar       bb    	   aggregate 0           cc  $aggregate           this       $t0       V  @        v  @        MixPoint       �     Point    AggType  	        F  	        X  	        V  	        v  	        J  	        G  	        H  	        SE  	        Dvar $	        sp $	        WF  	        W  	        mix  	           Copy 0           cc $Copy           this       $t0       h       MixPoint 0           cc  $MixPoint           this       $t0       Dvar       sp    	   aggregate 0           cc  $aggregate           this       $t0       V  @        v  @        CPoint       �     Point    AggType  	        F  	        X  	        V  	        v  	        J  	        G  	        H  	        SE  	        L  	        eq  	        ineq  	           CPoint 0           cc  $CPoint           this       $t0       e       i       Copy 0           cc $Copy           this       $t0       h       Vec 0           cc$Vec           this       $t0       ActionVariable       �     Discrete    L $	        pos  	        v  	        vals $	        N  	        actual  	        pdf  	           ActionVariable            cc  $ActionVariable          this       $t0       L  @    a    N  @       BinaryChoice       �     ActionVariable    L $	        pos  	        v  	        vals $	        N  	        actual  	        pdf  	           BinaryChoice            cc$BinaryChoice          this       $t0       $ox$end 	   $ox$pcode              q   #	   I    1    P    P    Lc   1   1   M   #	   A    R   #	   q   #   I    1    P    P    Lr   P    c   P   M   #   A    R   #      $ox$end 