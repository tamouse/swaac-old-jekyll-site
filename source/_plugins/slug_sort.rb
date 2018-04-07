# Sort the site posts by slug instead of date

module Jekyll

  module SlugSort

    def slug_sort(posts)
      slug_sorted_posts = posts.sort{|a,b| a.slug <=> b.slug }
      # Jekyll.logger.info slug_sorted_posts.inspect
      slug_sorted_posts
    end
    
  end

end

Liquid::Template.register_filter(Jekyll::SlugSort)
