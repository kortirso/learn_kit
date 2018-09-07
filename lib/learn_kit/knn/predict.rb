module LearnKit
  class Knn
    # Fit test data
    module Predict
      UNIFORM_WEIGHT = 1

      # input data
      # { k: 3, algorithm: 'brute', weight: 'uniform', point: [1, 2, 3] }
      # algorithms: brute
      # weights: uniform
      def predict(args = {})
        calc_distances(args)
        prediction(sort_points(args))
      end

      private

      # calc distances
      def calc_distances(args)
        case args[:algorithm]
          when 'brute' then brute_algorithm(args)
          else []
        end
      end

      # calculation with brute algorithm
      def brute_algorithm(args)
        data_set.keys.each do |key|
          data_set[key].each do |value|
            points << { distance: calc_distance(args[:point], value), label: key }
          end
        end
      end

      # sort points by distance, select first K, add weight
      def sort_points(args)
        points
          .sort_by { |point| point[:distance] }
          .first(args[:k])
          .map do |point|
            point[:weight] = UNIFORM_WEIGHT
            point
          end
      end

      # calc distance between 2 points
      def calc_distance(point1, point2, summ = 0)
        point1.each.with_index do |a, index|
          summ += (a - point2[index])**2
        end
        Math.sqrt(summ)
      end

      # prediction
      def prediction(sorted_points, result = {})
        sorted_points.each do |point|
          if result[point[:label]].nil?
            result[point[:label]] = point[:weight]
          else
            result[point[:label]] += point[:weight]
          end
        end
        result.sort_by { |_k, v| v }.reverse[0][0]
      end
    end
  end
end
