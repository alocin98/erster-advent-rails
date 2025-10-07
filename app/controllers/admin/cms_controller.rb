class Admin::CmsController < Admin::BaseController
  before_action :load_blocks, only: [ :edit ]

  def edit
  end

  def update
  end

  private
  def load_blocks
    @blocks = CmsBlock.order(:position)
  end

  def block_types
    CmsBlock.block_types.keys
  end
end
