use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'File::Attributes::Extended',
    VERSION_FROM      => 'lib/File/Attributes/Extended.pm', # finds $VERSION
    PREREQ_PM         => {},
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/File/Attributes/Extended.pm', # retrieve abstract from module
       AUTHOR         => 'Richard Dawe <rich@phekda.gotadsl.co.uk>') : ())
);
