module IdeasHelper

def facebook_like(idea_url)
            content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=https://empowler.herokuapp.com#{idea_url}&layout=standard&show_faces=false&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
end


end
