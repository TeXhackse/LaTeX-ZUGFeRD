$pdf_mode=4;

add_cus_dep( 'idx', 'ind', 0,'gind' );
sub gind {
	return system( "makeindex -s gind.ist -o \"$_[0].ind\" \"$_[0].idx\"" );
}
push @generated_exts, 'idx', 'ind';

add_cus_dep( 'glo', 'gls', 0,'gglo' );
sub gglo {
	return system( "makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"" );
}
push @generated_exts, 'gls', 'glo';
