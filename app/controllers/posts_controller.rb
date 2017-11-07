class PostsController < ApplicationController

  before_action :find_dates, :find_categories
  before_action :set_default_params, only: %i[index]

  def index
    @posts = Post.published
    filter_posts
    @posts = @posts.by_published_date.
             paginate(page: params[:page], per_page: 9).
             decorate
  end

  def show
    @post = Post.published.
            friendly.find(params[:id]).decorate
  end

  private

  def filter_posts
    params[:category].present? ? filter_posts_by_categories : filter_posts_by_range
  end

  def find_categories
    @categories = Post.published.category_counts
  end

  def find_dates
    @dates = Post.published.recent.by_published_date.
             pluck(:published_date)&.map { |x| x.strftime('%B, %Y') }&.uniq
  end

  def filter_posts_by_range
    @posts =
      case params[:range]
      when 'past' then @posts.past
      else @posts.recent.published_in Time.zone.parse(params[:date])
      end
  end

  def filter_posts_by_categories
    category = params[:category]
    return if category.blank?
    @posts = @posts.tagged_with category
  end

  def set_default_params
    params[:date]  ||= most_recent_post_date
    params[:range] ||= 'recent'
  end

  def most_recent_post_date
    post = Post.by_published_date.first
    date = post.present? ? post.published_date : Time.zone.now
    date.strftime('%B, %Y')
  end

end
