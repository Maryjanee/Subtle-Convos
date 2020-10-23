module ApplicationHelper
  def flash_message
    if !flash[:notice].blank?
      content_tag(:div,  notice, class: '.notice')
    end
  end
  
  def user_avatar(user, classname , other_image)
    if user.photo.attached?
      image_tag(user.photo, class: classname ) 
        else 
          image_tag("egg-avatar.jpg", class: classname ) 
       end 
  end
  
  def cover_image(user, classname, other_image)
    if user.cover_image.attached?
       image_tag(user.cover_image, class: classname )
    else
      image_tag(other_image, class: classname )
    end 
  end
  
  def button_display(user)
    if who_not_to_follow.exclude?(user.id)
     button_to relationships_path(followed_id: user.id), class: "mt-4 mr-4" do 
        image_tag("plus.svg", class: 'rounded-circle' )
     end
     end
     
  end
  
  
  def followers_display(user)
        
        if user.following.ids.empty?
                content_tag(:p, 'No Followers', class:'ml-3')
        else
            content_tag(:p, 'Followed by' )do
             link_to(first_user_name(user),  user_path(first_user_id(user)), class:'ml-3 inline line-grey')
            end
        end
    end
    
    def single_user_followers(followers)
       if followers.blank? 
         content_tag(:p, 'No Followers')
       end
    end
    
    def more_users(user)
      if who_not_to_follow.exclude?(user.id)
           user_avatar(user, 'user-image', 'egg-avatar.jpg')
          content_tag(:div, class:"ml-4 ") do
           content_tag(:h3) do
            link_to user.full_name, user_path(user.id), class: 'user-name text-uppercase'
           end
         followers_display(user)
       end
      end
    end

    def user_follower(followers)
        if followers.blank?
          content_tag(:p, 'No Followers')
        else
         followers
        end
    
    end
      

  
end

