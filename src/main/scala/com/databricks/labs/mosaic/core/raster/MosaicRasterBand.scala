package com.databricks.labs.mosaic.core.raster

import org.apache.spark.sql.types.DataType

import scala.reflect.ClassTag
import scala.reflect.runtime.universe.TypeTag

trait MosaicRasterBand extends Serializable {
  def index: Int
  def description: String
  def units: String
  def dataType: Int
  def xSize: Int
  def ySize: Int
  def minPixelValue: Double
  def maxPixelValue: Double
  def noDataValue: Double
  def pixelValueScale: Double
  def pixelValueOffset: Double
  def pixelValueToUnitValue(pixelValue: Double): Double
  def values[T: TypeTag: ClassTag]: Array[Array[T]] = values(0, 0, xSize, ySize)
  def values[T: TypeTag: ClassTag](xOffset: Int, yOffset: Int, xSize: Int, ySize: Int): Array[Array[T]]
}
