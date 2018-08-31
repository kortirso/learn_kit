module LearnKit
  module NaiveBayes
    class Gaussian
      # Calc accuracy for test data
      module Score
        # calculate accuracy for test data
        def score(total = 0, correct = 0)
          labels.each do |label_name|
            data_set[label_name].each do |feature|
              predicted_label = predict(feature)
              correct += 1 if predicted_label == label_name
              total += 1
            end
          end
          total.zero? ? 0 : (correct * 100.0 / total).round(4)
        end
      end
    end
  end
end
