$fn = 90;

module logo() {
    
    vier = [ 
        [ 0, 1 ],
        [ 0, 2 ],
        [ 1, 1 ],
        [ 1, 3 ],
        [ 2, 0 ],
        [ 2, 1 ],
        [ 2, 2 ],
        [ 2, 3 ],
        [ 2, 4 ],
        [ 3, 1 ]
    ];
    twee = [
        [ 0,0 ],
        [ 0,3 ],
        [ 1,0 ],
        [ 1,1 ],
        [ 1,4 ],
        [ 2,0 ],
        [ 2,2 ],
        [ 2,4 ],
        [ 3,0 ],
        [ 3,3 ]
    ];
    
    hek = [
        [ 0, 1 ],
        [ 1, 0 ],
        [ 1, 1 ],
        [ 1, 3 ],
        [ 2, 0 ],
        [ 2, 1 ],
        [ 2, 2 ],
        [ 2, 3 ],
        [ 3, 1 ],
        [ 3, 2 ],
        [ 3, 3 ],
        [ 3, 4 ],
        [ 4, 1 ],
        [ 4, 3 ],
        [ 4, 4 ],
        [ 5, 0 ],
        [ 5, 1 ],
        [ 5, 3 ],
        [ 6, 0 ],
        [ 6, 1 ],
        [ 6, 2 ],
        [ 6, 3 ],
        [ 7, 1 ],
        [ 7, 2 ],
        [ 7, 3 ],
        [ 7, 4 ],
        [ 8, 1 ],
        [ 8, 3 ],
        [ 8, 4 ],
        [ 9, 3 ],
    ];
    
    translate( [ -11.5/2, -8/2 ] ) {
        
        translate( [ 0, 3 ] ) for ( i = hek ) {
            translate( [ i[0]/2, i[1] ] ) square( [ 1/2, 1 ] );
        }
        translate( [ 3.5, 0 ] ) for ( i = vier ) {
            translate( [ i[0], i[1] ] ) square( [ 1, 1 ] );
        }
        translate( [ 7.5, 0 ] ) for ( i = twee ) {
            translate( [ i[0], i[1] ] ) square( [ 1, 1 ] );
        }
    }
        
        
    
}


module round_tuit() {
    
    module face() {
        linear_extrude( height = 1.5 ) {
            difference() {
                circle( d = 34 );
                text( "TUIT", 
                    font="Noto Sans:style=Bold", 
                    //font="Open Sans:style=Bold",
                    //font="PT Sans:style=Bold",
                    //font="Source Sans Pro:style=Bold",
                    halign="center", valign="center" 
                );
            }
        }
    }
    
    module obverse() {
        linear_extrude( height = 1.5 ) {
            difference() {
                circle( d = 34 );
                translate( [ -1, 0 ] )
                scale( 2.2 ) logo();
            }
        }
    }
    
    difference() {
        translate( [ 0, 0, -2 ] ) cylinder( d = 40, h = 4 );
        translate( [ 0, 0, 1 ] ) face();
        translate( [ 0, 0, -1 ] ) rotate( [ 180, 0, 0 ] ) obverse();
    }
    
}

difference() {
    round_tuit();
    // just for viewing the cross section
*    translate( [0, 0, -5 ] ) cube( [ 30, 30, 10 ] );
}
