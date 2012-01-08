use 5.008004;
use ExtUtils::MakeMaker;


WriteMakefile
(
    'NAME'         => 'Locale::SubCountry',
    'VERSION_FROM' => 'lib/Locale/SubCountry.pm',
    'ABSTRACT'     => 'convert state, province, county ... names to/from ISO 3166-2 code',
    'AUTHOR'       => 'Kim Ryan <kimryan at cpan org>',
    'LICENSE'      => 'perl',   
    'PREREQ_PM'    => {}, # e.g., Module::Name => 1.1
);
