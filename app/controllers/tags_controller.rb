class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Tag
    @tags = policy_scope(Tag.where(Tag.arel_table[:cached_count].gt(0))
      .order(cached_count: :desc, name: :asc)
      .search(params[:q])).page(params[:page])
    @title = "Tags"
    @active_sidenav = :tags

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @tag = current_user.tags.find_by!(name: params[:id])
    authorize @tag
    @title = "##{@tag.name}"

    @mistakes = @tag.mistakes.order(id: :desc)

    @stats = {
      count: @mistakes.count,
      avg_diff: compute_avg_diff(@mistakes),
      incomplete: @mistakes.incomplete.count
    }

    @mistakes = @mistakes.page(params[:page])
  end

  private

  def compute_avg_diff(mistakes)
    description_sum = mistakes.complete.sum(:description_rating)
    reflection_sum = mistakes.complete.sum(:reflection_rating)
    total_count = mistakes.complete.count

    ((reflection_sum - description_sum).to_f / total_count).round(2)
  end
end
