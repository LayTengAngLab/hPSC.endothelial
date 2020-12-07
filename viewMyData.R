#' View MyData data in the scClustViz Shiny app
#'
#' A wrapper function to view the \code{MyData} dataset in the
#' \code{scClustViz} Shiny app.
#'
#' @param outPath Default = "./" (the working directory). Specify the
#'   directory used to save/load any analysis files you generate while
#'   exploring the \code{MyData} data.
#'
#' @return The function causes the scClustViz Shiny GUI app to open in a
#'   seperate window.
#'
#' @examples
#'   viewMyData()
#'
#' @seealso \url{https://baderlab.github.io/scClustViz} for information on
#'   \code{scClustViz}.
#'
#' @export
#'
viewMyData <- function(outPath="./",imageFileType="tiff") {
        filePath <- system.file("PSC-Endothelial.RData",
                                package="hPSC.endothelial")
        cellMarkers <- list()
        # If you have a list of cell-type marker genes for you data,
        # add them here!

        # Change "org.Hs.eg.db" to the appropriate AnnotationDbi object for your
        # data. This way if your user has the library installed, it will be used,
        # otherwise it will be skipped without causing any errors.
        if (require("org.Hs.eg.db",quietly=T)) {
                annotationDB <- org.Hs.eg.db
                scClustViz::runShiny(filePath=filePath,
                                     outPath=outPath,
                                     cellMarkers=cellMarkers,
                                     annotationDB=annotationDB,
                                     imageFileType=imageFileType)

        } else {
                scClustViz::runShiny(filePath=filePath,
                                     outPath=outPath,
                                     cellMarkers=cellMarkers,
                                     imageFileType=imageFileType)
        }
}


