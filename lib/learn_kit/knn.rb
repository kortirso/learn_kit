require_relative 'knn/predict'

module LearnKit
  # K-Nearest Neighbors algorithm
  class Knn
    class LearnFailure < StandardError; end

    include LearnKit::Knn::Predict

    attr_reader :data_set, :points

    # input data
    # { label1: [[f1, f2, f3], [f1, f2, f3]], label2: [[f4, f5, f6], [f4, f5, f6]] }
    def initialize(args = {})
      @data_set = args[:data_set]
      @points = []
    end
  end
end
