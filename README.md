# LearnKit


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'learn_kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install learn_kit

### K-Nearest Neighbors

#### Simple

Initialize classificator with data set consists from labels and features:

```ruby
  data_set = { label1: [[-1, -1], [-2, -1], [-3, -2]], label2: [[1, 1], [2, 1], [3, 2], [-2, -2]] }
  clf = LearnKit::Knn.new(data_set: data_set)
```

Predict label for new feature:

```ruby
  clf.predict(k: 3, algorithm: 'brute', weight: 'uniform', point: [-1, -2])
```
    k - number of nearest neighbors
    algorithm - algorithm for calculation of distances, one of the [brute]
    weight - method of weighted neighbors, one of the [uniform]
    point - new feature for prediction

### Naive Bayes

#### Gaussian

Initialize classificator with data set consists from labels and features:

```ruby
  data_set = { label1: [[-1, -1], [-2, -1], [-3, -2]], label2: [[1, 1], [2, 1], [3, 2], [-2, -2]] }
  clf = LearnKit::NaiveBayes::Gaussian.new(data_set: data_set)
```

Make fit of test data:

```ruby
  clf.fit
```

Predict label for new feature:

```ruby
  clf.predict([-1, -2])
```

Or show probability for all labels:

```ruby
  clf.predict_proba([-1, -2])
```

Calculate accuracy for test data:

```ruby
  clf.score
```
