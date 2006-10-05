use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'File::Attributes::Extended',
    AUTHOR              => 'Richard Dawe <richdawe@cpan.org>',
    VERSION_FROM        => 'lib/File/Attributes/Extended.pm',
    ABSTRACT_FROM       => 'lib/File/Attributes/Extended.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'File-Attributes-Extended-*' },
);
