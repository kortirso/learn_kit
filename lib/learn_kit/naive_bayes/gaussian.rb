require_relative 'gaussian/fit'
require_relative 'gaussian/predict'
require_relative 'gaussian/score'

module LearnKit
  module NaiveBayes
    # Gaussian NB
    class Gaussian
      include LearnKit::NaiveBayes::Gaussian::Fit
      include LearnKit::NaiveBayes::Gaussian::Predict
      include LearnKit::NaiveBayes::Gaussian::Score

      attr_reader :data_set, :labels, :feature_size, :fit_results

      def initialize(args = {})
        @data_set = args[:data_set]
        @labels = data_set.keys
        @feature_size = data_set.values.first[0].size
        @fit_results = {}
      end
    end
  end
end
