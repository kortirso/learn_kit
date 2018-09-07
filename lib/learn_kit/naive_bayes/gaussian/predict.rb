module LearnKit
  module NaiveBayes
    class Gaussian
      # Predict new data
      module Predict
        # returns prediction of label for feature
        # input data
        # [f1, f2, f3]
        # output data
        # :label2
        def predict(feature_values)
          res = labels.sort_by do |label_name|
            class_probability(feature_values, label_name)
          end
          res[-1]
        end

        # returns labels with probabilities
        # input data
        # [f1, f2, f3]
        # output data
        # { label1: 0.01, label2: 0.02 }
        def predict_proba(feature_values, result = {})
          labels.each do |label_name|
            result[label_name] = class_probability(feature_values, label_name)
          end
          result
        end

        private

        # compute the final naive Bayesian probability for a given set of features being a part of a given label
        def class_probability(feature_values, label_name)
          class_fraction = 1.0 / labels.size
          feature_bayes = feature_mult(feature_values, label_name)
          feature_bayes * class_fraction
        end

        # multiply together the feature probabilities for all of the features in a label for given values
        def feature_mult(feature_values, label_name, res = 1.0)
          feature_values.each.with_index do |feature_value, index|
            res *= feature_probability(index, feature_value, label_name)
          end
          res
        end

        def feature_probability(index, value, label_name)
          # select result from training
          fit_result = fit_results[label_name][index]
          # deal with the edge case of a 0 standard deviation
          return fit_result[:fs_mean] == value ? 1.0 : 0.0 if fit_result[:fs_std].zero?
          # calculate the gaussian probability
          exp = - ((value - fit_result[:fs_mean])**2) / (2 * fit_result[:fs_var])
          (1.0 / Math.sqrt(2 * Math::PI * fit_result[:fs_var])) * (Math::E**exp)
        end
      end
    end
  end
end
