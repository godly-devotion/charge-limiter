JsOsaDAS1.001.00bplist00�Vscripto: v a r   a p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) 
 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e 
 
 v a r   v e r s i o n   =   ' v '   +   a p p . d o S h e l l S c r i p t ( ` d e f a u l t s   r e a d   ' $ { a p p . p a t h T o ( t h i s ) } / C o n t e n t s / I n f o . p l i s t '   C F B u n d l e S h o r t V e r s i o n S t r i n g ` ) 
 v a r   l a t e s t V e r s i o n   =   a p p . d o S h e l l S c r i p t ( ` c u r l   - s   ' h t t p s : / / a p i . g i t h u b . c o m / r e p o s / g o d l y - d e v o t i o n / c h a r g e - l i m i t e r / r e l e a s e s / l a t e s t '   |   a w k   - F   ' " '   ' / t a g _ n a m e / { p r i n t   $ 4 } ' ` ) 
 v a r   u r l   =   ` h t t p s : / / g i t h u b . c o m / g o d l y - d e v o t i o n / c h a r g e - l i m i t e r / r e l e a s e s / l a t e s t ` 
 
 i f   ( l a t e s t V e r s i o n   & &   v e r s i o n   ! = =   l a t e s t V e r s i o n )   { 
 	 i f   ( a p p . d i s p l a y A l e r t ( ` A   n e w   v e r s i o n   o f   C h a r g e   L i m i t e r   i s   a v a i l a b l e ! ` ,   { 
 	 	 m e s s a g e :   ` C h a r g e   L i m i t e r   $ { l a t e s t V e r s i o n }   i s   n o w   a v a i l a b l e  y o u   h a v e   $ { v e r s i o n } .   W o u l d   y o u   l i k e   t o   g e t   t h e   u p d a t e ? ` , 
 	 	 a s :   ' c r i t i c a l ' , 
 	 	 b u t t o n s :   [ ' R e m i n d   M e   L a t e r ' ,   ' G e t   U p d a t e ' ] , 
 	 	 d e f a u l t B u t t o n :   ' G e t   U p d a t e ' 
 	 } ) . b u t t o n R e t u r n e d   = = =   ' G e t   U p d a t e ' )   { 
 	 	 a p p . d o S h e l l S c r i p t ( ` o p e n   ' $ { u r l } ' ` ) 
 	 } 
 } 
 
 v a r   p a r e n t P a t h   =   a p p . p a t h T o ( t h i s )   +   ' / C o n t e n t s / R e s o u r c e s ' ; 
 
 a p p . d o S h e l l S c r i p t ( ` c h m o d   + x   ' $ { p a r e n t P a t h } / b c l m ' ` ) 
 v a r   c h a r g e L e v e l   =   a p p . d o S h e l l S c r i p t ( ` ' $ { p a r e n t P a t h } / b c l m '   r e a d ` ) 
 
 v a r   r e s p o n s e   =   a p p . d i s p l a y D i a l o g ( ` T h i s   u t i l i t y   a l l o w s   y o u   t o   s e t   t h e   m a x i m u m   b a t t e r y   c h a r g e   l i m i t . \ n \ n T h e   c u r r e n t   c h a r g e   l i m i t   i s :   $ { c h a r g e L e v e l } % \ n \ n C h a r g e   L i m i t   ( 4 0 - 1 0 0 ,   d e f a u l t   i s   1 0 0 ) : ` ,   { 
 	 w i t h T i t l e :   ` C h a r g e   L i m i t e r   $ { v e r s i o n } ` , 
         d e f a u l t A n s w e r :   ' ' , 
         b u t t o n s :   [ ' C l o s e ' ,   ' S e t   C h a r g e   L i m i t ' ] , 
         d e f a u l t B u t t o n :   ' S e t   C h a r g e   L i m i t ' , 
 	 c a n c e l B u t t o n :   ' C l o s e ' 
 } ) 
 
 i f   ( i s N a N ( r e s p o n s e . t e x t R e t u r n e d ) )   { 
         a p p . d i s p l a y D i a l o g ( ' P l e a s e   e n t e r   a   n u m b e r   f r o m   4 0 - 1 0 0 . ' ,   { 
 	 	 b u t t o n s :   [ ' C a n c e l ' ] , 
 	 	 d e f a u l t B u t t o n :   ' C a n c e l ' 
 	 } ) 
 } 
 
 v a r   v a l u e   =   N u m b e r ( r e s p o n s e . t e x t R e t u r n e d ) 
 i f   ( v a l u e   <   4 0   | |   v a l u e   >   1 0 0   )   { 
 	 a p p . d i s p l a y D i a l o g ( ' P l e a s e   e n t e r   a   n u m b e r   f r o m   4 0 - 1 0 0 . ' ,   { 
 	 	 b u t t o n s :   [ ' C a n c e l ' ] , 
 	 	 d e f a u l t B u t t o n :   ' C a n c e l ' 
 	 } ) 
 } 
 
 t r y   { 
 	 a p p . d o S h e l l S c r i p t ( ` s u d o   ' $ { p a r e n t P a t h } / b c l m '   w r i t e   $ { v a l u e } ` ,   {   a d m i n i s t r a t o r P r i v i l e g e s :   t r u e   } ) 
 	 
 	 i f   ( v a l u e   = = =   1 0 0 )   { 
 	 	 a p p . d o S h e l l S c r i p t ( ` s u d o   r m   ' / L i b r a r y / L a u n c h D a e m o n s / c o m . z a c k e l i a . b c l m . p l i s t ' ` ,   {   a d m i n i s t r a t o r P r i v i l e g e s :   t r u e   } ) 
 	 	 
 	 	 a p p . d i s p l a y D i a l o g ( ` S u c c e s s ! \ n \ n T h e   b a t t e r y   w i l l   n o w   f u l l y   c h a r g e . ` ,   { 
 	 	 	 w i t h T i t l e :   ` C h a r g e   L i m i t e r   $ { v e r s i o n } ` , 
 	 	 	 b u t t o n s :   [ ' O K ' ] , 
 	 	 	 d e f a u l t B u t t o n :   [ ' O K ' ] 
 	 	 } ) 
 	 } 
 	 e l s e   { 
 	 	 a p p . d o S h e l l S c r i p t ( ` s u d o   ' $ { p a r e n t P a t h } / b c l m '   p e r s i s t ` ,   {   a d m i n i s t r a t o r P r i v i l e g e s :   t r u e   } ) 
 	 
 	 	 a p p . d i s p l a y D i a l o g ( ` S u c c e s s ! \ n \ n I f   y o u r   M a c B o o k   c u r r e n t l y   h a s   m o r e   t h a n   $ { v a l u e } %   c h a r g e ,   l e a v e   t h e   c h a r g e r   u n p l u g g e d   u n t i l   t h e   b a t t e r y   l e v e l   i s   a   l i t t l e   l e s s   t h a n   t h a t .   A f t e r w a r d s ,   y o u   c a n   l e a v e   t h e   M a c B o o k   c o n n e c t e d   t o   t h e   c h a r g e r   a n d   t h e   b a t t e r y   w i l l   n o t   c h a r g e   o v e r   $ { v a l u e } % . ` ,   { 
 	 	 	 w i t h T i t l e :   ` C h a r g e   L i m i t e r   $ { v e r s i o n } ` , 
 	 	 	 b u t t o n s :   [ ' O K ' ] , 
 	 	 	 d e f a u l t B u t t o n :   [ ' O K ' ] 
 	 	 } ) 
 	 } 
 } 
 c a t c h   ( e )   { 
 	 a p p . d i s p l a y D i a l o g ( ` T h e r e   w a s   a   p r o b l e m   s e t t i n g   t h e   c h a r g e   l i m i t .   P l e a s e   m a k e   s u r e   y o u   h a v e   a d m i n i s t r a t o r   p r i v i l e g e s . ` ,   { 
 	 	 w i t h T i t l e :   ` C h a r g e   L i m i t e r   $ { v e r s i o n } ` , 
 	 	 b u t t o n s :   [ ' O K ' ] , 
 	 	 d e f a u l t B u t t o n :   [ ' O K ' ] 
 	 } ) 
 }                              �jscr  ��ޭ