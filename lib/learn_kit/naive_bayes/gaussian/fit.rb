require 'descriptive_statistics'

module LearnKit
  module NaiveBayes
    class Gaussian
      # Fit test data
      module Fit
        # input data
        # { label1: [[f1, f2, f3], [f1, f2, f3]], label2: [[f4, f5, f6], [f4, f5, f6]] }
        # output data
        # { label1: [{fs_std1: 1, fs_mean1: 2, fs_var1: 3}, {..}, {..}], label2: [{fs_std1: 1, fs_mean1: 2, fs_var1: 3}, {..}, {..}] }
        def fit
          labels.each do |label_name|
            fit_results[label_name] = []
            (0...feature_size).each do |index|
              fs = feature_set(index, label_name)
              # statistical properties of the feature set
              fs_std = fs.standard_deviation
              fs_mean = fs.mean
              fs_var = fs.variance
              fit_results[label_name] << { fs_std: fs_std, fs_mean: fs_mean, fs_var: fs_var }
            end
          end
        end

        private

        # Get all the features of a certain index in a given label in one set
        # index - feature index in training set
        # label_name - label name
        def feature_set(index, label_name, feature_set = [])
          data_set[label_name].each do |feature|
            feature_set << feature[index]
          end
          feature_set
        end
      end
    end
  end
end
