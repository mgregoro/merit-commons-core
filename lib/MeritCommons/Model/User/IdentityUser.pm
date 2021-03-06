#    MeritCommons Portal
#    Copyright 2013 Wayne State University
#    All Rights Reserved

package MeritCommons::Model::User::IdentityUser;

use base qw/DBIx::Class/;
use Carp qw(croak);

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('meritcommons_user_identityuser');

__PACKAGE__->add_columns(
    id => {
        is_auto_increment => 1,
        data_type         => 'integer',
        is_numeric        => 1,
    },
    meritcommons_user => {
        data_type      => 'integer',
        is_foreign_key => 1,
        is_numeric     => 1,
        is_nullable    => 1,
    },
    identity => {
        data_type      => 'integer',
        is_foreign_key => 1,
        is_numeric     => 1,
        is_nullable    => 1,
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(meritcommons_user => 'MeritCommons::Model::User');
__PACKAGE__->belongs_to(identity       => 'MeritCommons::Model::User::Identity');
__PACKAGE__->add_unique_constraint(user_identityuser => [qw/meritcommons_user identity/]);

sub user {
    shift->meritcommons_user(@_);
}

sub sqlt_deploy_hook {
    my ($self, $sqlt_table) = @_;
}
