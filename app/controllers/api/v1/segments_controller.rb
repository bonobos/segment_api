class Api::V1::SegmentsController < ApplicationController
  def create
    ::SegmentJob.run(params.permit!)
  end
end
