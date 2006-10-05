#!perl -w

use strict;
use Test::More tests => 8;
use File::Attributes qw ':all';
use File::ExtAttr 1.01 qw/getfattr/;
use File::Temp qw/tempfile/;
use Cwd;

my ($fh, $file) = tempfile("basicXXXXXX", DIR => cwd(), UNLINK => 1);

set_attribute($file, type     => 'text/plain');
set_attribute($file, encoding => 'utf8');
    
my @attributes = list_attributes($file);
is(grep(/^type$/, @attributes), 1);
is(grep(/^encoding$/, @attributes), 1);
is(scalar(@attributes), 2);
 
my %attributes = get_attributes($file);
is($attributes{type}, 'text/plain');
is(getfattr($file, 'type'), 'text/plain');
is($attributes{encoding}, 'utf8');
is(getfattr($file, 'encoding'), 'utf8');
is($attributes{foo}, undef);
