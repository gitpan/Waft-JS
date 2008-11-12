
use Test;
BEGIN { plan tests => 1 };

use strict;
use vars qw( @ISA );
BEGIN { eval { require warnings } ? 'warnings'->import : ( $^W = 1 ) }

use Waft with => '::JS';

my ($text_part, $code);

$text_part =   qq{<script>\n}
             . qq{\tWaft.JS.url();\n}
             . qq{</script>};
$code =   qq{\$Waft::Self->output('<script>');\x0A}
        . qq{\$Waft::Self->output("\\x0A\t");}
        . qq{\$Waft::Self->output_js_make_url_script;}
        . qq{\$Waft::Self->output('();');\x0A}
        . qq{\$Waft::Self->output("\\x0A</script>");};
ok( __PACKAGE__->convert_text_part($text_part, "\x0A") eq $code );
