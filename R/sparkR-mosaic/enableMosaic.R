#' enableMosaic
#' 
#' @description enableMosaic activates the context dependent Databricks Mosaic functions, giving control over the geometry API and index system used.
#' See \url{https://databrickslabs.github.io/mosaic/} for full documentation
#' @param geometryAPI character, default="ESRI"
#' @param indexSystem character, default="H3"
#' @name enableMosaic
#' @rdname enableMosaic
#' @return None
#' @export enableMosaic
#' @examples
#' \dontrun{
#' enableMosaic()
#' enableMosaic("ESRI", "H3")
#' enableMosaic("ESRI", "BNG") # Not yet supported}
enableMosaic <- function(
  geometryAPI="ESRI"
  ,indexSystem="H3"
){
  geometry_api <- sparkR.callJStatic(x="com.databricks.labs.mosaic.core.geometry.api.GeometryAPI", methodName="apply", geometryAPI)
  index_system_id <- sparkR.callJStatic(x="com.databricks.labs.mosaic.core.index.IndexSystemID", methodName="apply", indexSystem)
  indexing_system <- sparkR.callJStatic(x="com.databricks.labs.mosaic.core.index.IndexSystemID", methodName="getIndexSystem", index_system_id)
  mosaic_context <- sparkR.newJObject(x="com.databricks.labs.mosaic.functions.MosaicContext", indexing_system, geometry_api)
  functions <<- sparkR.callJMethod(mosaic_context, "functions")
  
}