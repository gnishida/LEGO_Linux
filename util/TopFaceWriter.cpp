#include "TopFaceWriter.h"
#include <fstream>
#include "ContourUtils.h"

namespace util {
	
	namespace topface {

		void TopFaceWriter::write(const std::string& filename, double width, double height, double offset_x, double offset_y, double offset_z, double scale, const std::vector<std::shared_ptr<BuildingLayer>>& buildings) {
			std::vector<Face> faces;
			for (auto& building : buildings) {
				collectTopFaces(building, faces);
			}

			std::ofstream out(filename);
			out << "# ground level" << std::endl;
			out << std::setprecision(20) << offset_z << std::endl;

			out << "# num of layers" << std::endl;
			out << faces.size() << std::endl;

			for (int fi = 0; fi < faces.size(); fi++) {
				out << "# layer " << fi + 1 << std::endl;
				out << "# height of the top face" << std::endl;
				out << std::setprecision(20) << faces[fi].height * scale + offset_z << std::endl;
				
				util::Ring ring = faces[fi].polygon.contour.getActualPoints();
				std::vector<cv::Point2f> points(ring.size());
				for (int i = 0; i < ring.size(); i++) {
					points[i] = cv::Point2f(ring[i].x, ring[i].y);
				}

				out << "# num of points of contour" << std::endl;
				out << points.size() << std::endl;
				for (auto& pt : points) {
					out << std::setprecision(20) << (pt.x + width * 0.5) * scale + offset_x << "," << (pt.y - height * 0.5) * scale + offset_y << std::endl;
				}

				out << "# num of holes" << std::endl;
				out << faces[fi].polygon.holes.size() << std::endl;
				for (int hi = 0; hi < faces[fi].polygon.holes.size(); hi++) {
					util::Ring hole = faces[fi].polygon.holes[hi].getActualPoints();
					std::vector<cv::Point2f> points(ring.size());
					for (int i = 0; i < ring.size(); i++) {
						points[i] = cv::Point2f(ring[i].x, ring[i].y);
					}

					out << "# num of points of hole " << hi + 1 << std::endl;
					out << points.size() << std::endl;
					for (auto& pt : points) {
						out << std::setprecision(20) << (pt.x + width * 0.5) * scale + offset_x << "," << (pt.y - height * 0.5) * scale + offset_y << std::endl;
					}
				}
			}

			out.close();
		}

		void TopFaceWriter::collectTopFaces(std::shared_ptr<BuildingLayer> building, std::vector<Face>& faces) {
			for (auto& polygon : building->footprints) {
				faces.push_back(Face(polygon, building->top_height));
			}

			if (building->child) {
				collectTopFaces(building->child, faces);
			}
		}

	}

}