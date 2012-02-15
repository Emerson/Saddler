require './lib/saddler'


arr1 = Saddler.find([[39, 43, 49, 29, 18],
                     [30, 47, 24, 29, 15],
                     [49, 50, 39, 20, 33],
                     [18, 38, 35, 32, 35],
                     [29, 44, 18, 34, 44]])

arr2 = Saddler.find([[50, 27, 36, 43, 39],
                     [36, 14, 35, 40, 19],
                     [20, 33, 48, 32, 40],
                     [41, 40, 15, 22, 19],
                     [21, 24, 24, 31, 18]])

arr3 = Saddler.find([[39, 43, 49, 29, 18],
                     [30, 47, 24, 29, 15],
                     [49, 50, 39, 20, 33],
                     [18, 38, 35, 32, 38],
                     [29, 44, 18, 34, 44]])


arr1.empty? ? (puts "No saddle points found in arr1") : (puts "arr1 has saddle points at: #{arr1.inspect}")

arr2.empty? ? (puts "No saddle points found in arr2") : (puts "arr2 has saddle points at: #{arr2.inspect}")

arr3.empty? ? (puts "No saddle points found in arr3") : (puts "arr3 has saddle points at: #{arr3.inspect}")


# On Ruby 1.9.3-p0 this program returns:
#
# >time ruby quiz.rb
#
# => arr1 has saddle points at: [{:x=>1, :y=>3}]
# => No saddle points found in arr2
# => arr3 has saddle points at: [{:x=>1, :y=>3}]
#
# => real    0m0.035s
# => user 0m0.024s
# => sys  0m0.009s