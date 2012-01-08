#------------------------------------------------------------------------------
# Test script for CPAN module Locale::SubCountry 
#                                            
# Author: Kim Ryan 
#------------------------------------------------------------------------------

use strict;
use warnings;
use Test::Simple tests => 20;
use Locale::SubCountry;

my $australia = new Locale::SubCountry('Australia');

ok($australia->code('New South Wales ') eq 'NSW', "Convert sub country full name to code");

ok($australia->full_name('S.A.') eq 'South Australia', "Convert sub country code to full name, accounted for full stops");

my $upper_case = 1;
ok($australia->full_name('Qld',$upper_case) eq 'QUEENSLAND', "Covert sub country code lower case to full name");

ok($australia->country_code eq 'AU', "Correct country code for country object");

ok($australia->category('NSW') eq 'state', "Correct category for a sub country code");

ok($australia->ISO3166_2_code('01') eq 'ACT', "Convert FIPS code to ISO3166 2 letter code");

ok($australia->FIPS10_4_code('ACT') eq '01', "Convert ISO3166 2 letter code to FIPS code ");

my %states =  $australia->full_name_code_hash;
ok($states{'Tasmania'} eq 'TAS', "Contents of full_name_code_hash");

%states =  $australia->code_full_name_hash;
ok($states{'SA'} eq 'South Australia' , "Contents of code_full_name_hash");

my @states = $australia->all_codes;
ok(@states == 8, "Total number of sub countries in a country");

my @all_names = $australia->all_full_names;
ok($all_names[1] eq 'New South Wales' , "Order of  all_full_names array");

ok($australia->code('Old South Wales ') eq 'unknown', "Unknown sub country full name");

ok($australia->full_name('XYZ') eq 'unknown', "Unknown sub country code");

# Tests for World object
my $world = new Locale::SubCountry::World;

my %countries =  $world->full_name_code_hash;
ok($countries{'New Zealand'} eq 'NZ', "Contents of full_name_code_hash for world object");

%countries =  $world->code_full_name_hash;
ok($countries{'GB'} eq 'United Kingdom', "Contents of code_full_name_hash for world object");

my @all_country_codes = $world->all_codes;
ok(@all_country_codes, "all_codes method returns data for world object");

my @all_country_names = $world->all_full_names;
ok(@all_country_names, "all_full_names method returns data for world object");

my $UK = new Locale::SubCountry('GB');
ok($UK->regional_division('DGY') eq 'SCT', "Initialise new method with a 2 letter country code");

my $BR = Locale::SubCountry->new('BR');
ok length $BR->full_name('PR') == 6, "Proper encoding";
ok length $BR->full_name('MA') == 8, "Proper encoding";
