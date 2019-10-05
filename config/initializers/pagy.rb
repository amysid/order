require 'pagy/extras/navs'
require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'
Pagy::VARS[:items] = 10
Pagy::VARS[:size]  = [5,4,4,5]
Pagy::VARS[:overflow] = :last_page
