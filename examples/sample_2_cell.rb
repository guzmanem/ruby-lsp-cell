# typed: false
# frozen_string_literal: true

#
# SampleCell
#
class Sample2Cell < Cell::ViewModel
  # === VALID FUNCTIONS ===
  def new
    render
  end

  def show
    render
  end

  def edit
    render params
  end

  # === INVALID FUNCTIONS ===
  def destroy; end

  def index
    render_fake
  end
end
