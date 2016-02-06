calculateLength = (x, y, z) -> Math.sqrt (x * x) + (y * y) + (z * z)

class Vector
	constructor: (@x = 0, @y = 0, @z = 0) ->
		@isNormalized = undefined
		return @

	@fromObject: (object) ->
		return new Vector(
			object.x,
			object.y,
			object.z
		)

	@fromArray: (array) ->
		return new Vector(
			array[0],
			array[1],
			array[2]
		)

	toObject: (array) ->
		return {
			x: @x
			y: @y
			z: @z
		}

	toJSON: () -> @toObject()

	clone: () -> new Vector @x, @y, @z

	add: (vector) ->
		@x += vector.x
		@y += vector.y
		@z += vector.z

		return @

	subtract: (vector) ->
		@x -= vector.x
		@y -= vector.y
		@z -= vector.z

		return @

	scaleUniformlyBy: (scalar) ->
		@x *= scalar
		@y *= scalar
		@z *= scalar

		return @

	scaleBy: ({x = 1, y = 1, z = 1} = {}) ->
		@x *= x
		@y *= y
		@z *= z

		return @

	length: () -> calculateLength @x, @y, @z

	euclideanDistanceTo: (vector) ->
		return calculateLength(
			@x - vector.x
			@y - vector.y
			@z - vector.z
		)

	normalize: () ->
		@isNormalized = true
		@scaleUniformlyBy 1 / @length()
		return @

	crossProduct: (vector) ->
		return new Vector(
			(@y * vector.z) - (@z * vector.y)
			(@z * vector.x) - (@x * vector.z)
			(@x * vector.y) - (@y * vector.x)
		)


module.exports = Vector
