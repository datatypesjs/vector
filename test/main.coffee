runTest = require('ava')
Vector = require('../index')


runTest 'Instantiates a zero vector without an argument', (test) ->
	vector = new Vector()
	test.same(vector.toObject(), {x: 0, y: 0, z: 0})


runTest 'Instantiates a vector from x, y & z arguments', (test) ->
	vector = new Vector(1, 2, 3)
	test.same(vector.toObject(), {x: 1, y: 2, z: 3})


runTest 'Instantiates a vector from an object', (test) ->
	vector = Vector.fromObject({x: 1, y: 2, z: 3})
	test.same(vector.toObject(), {x: 1, y: 2, z: 3})


runTest 'Instantiates a vector from an array', (test) ->
	vector = Vector.fromArray([1, 2, 3])
	test.same(vector.toObject(), {x: 1, y: 2, z: 3})


runTest 'Outputs JSON', (test) ->
	vector = new Vector(1, 2, 3)
	vector.uselessProperty = 'useless'
	test.same(JSON.stringify(vector), '{"x":1,"y":2,"z":3}')


runTest 'Gets cloned', (test) ->
	vector = new Vector(1, 2, 3)
	clonedVector = vector.clone()
	vector.x = 9
	test.same(JSON.stringify(clonedVector), '{"x":1,"y":2,"z":3}')


runTest 'Adds a vector', (test) ->
	vectorA = new Vector(1, 2, 3)
	vectorB = new Vector(4, 5, 6)
	expectedVector = new Vector(5, 7, 9)
	vectorA.add(vectorB)
	test.same(vectorA, expectedVector)


runTest 'Subtracts a vector', (test) ->
	vectorA = new Vector(4, 2, 0)
	vectorB = new Vector(3, 5, 7)
	expectedVector = new Vector(1, -3, -7)
	vectorA.subtract(vectorB)
	test.same(vectorA, expectedVector)


runTest 'Scales a vector uniformly', (test) ->
	vector = new Vector(4, 2, 1)
	scalingFactor = 1.5
	expectedVector = new Vector(6, 3, 1.5)
	vector.scaleUniformlyBy(scalingFactor)
	test.same(vector, expectedVector)


runTest 'Scales a vector', (test) ->
	vectorA = new Vector(4, 2, 1)
	scalingObject = {x: 2, y: 3, z: 5}
	expectedVector = new Vector(8, 6, 5)
	vectorA.scaleBy(scalingObject)
	test.same(vectorA, expectedVector)


runTest 'Returns a vector\'s length', (test) ->
	vector = new Vector(3, 3, 3)
	expectedLength = Math.sqrt(27)
	test.same(vector.length(), expectedLength)


runTest 'Returns the euclidian distance to a vector', (test) ->
	vectorA = new Vector(4, 2, 0)
	vectorB = new Vector(3, 5, 7)
	expectedDistance = 7.681145747868608
	test.same(vectorA.euclideanDistanceTo(vectorB), expectedDistance)


runTest 'Normalizes a vector', (test) ->
	vector = new Vector(3, 3, 3)
	vector.normalize()
	expectedVector = new Vector(
		0.5773502691896257,
		0.5773502691896257,
		0.5773502691896257
	)
	expectedVector.isNormalized = true
	test.same(vector, expectedVector)


runTest 'Returns the cross product of two vectors', (test) ->
	vectorA = new Vector(4, 2, 0)
	vectorB = new Vector(3, 5, 7)
	orthogonalVector = new Vector(14, -28, 14)
	test.same(vectorA.crossProduct(vectorB), orthogonalVector)
