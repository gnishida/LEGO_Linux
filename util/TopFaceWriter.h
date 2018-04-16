#pragma once

#include <vector>
#include <string>
#include <opencv2/opencv.hpp>
#include "BuildingLayer.h"

namespace util {

	namespace topface {

		class Face {
		public:
			util::Polygon polygon;
			double height;

		public:
			Face(const util::Polygon& polygon, double height) : polygon(polygon), height(height) {}
		};

		class TopFaceWriter {
		protected:
			TopFaceWriter() {}

		public:
			static void write(const std::string& filename, double width, double height, double offset_x, double offset_y, double offset_z, double scale, const std::vector<std::shared_ptr<BuildingLayer>>& buildings);

		private:
			static void collectTopFaces(std::shared_ptr<BuildingLayer> building, std::vector<Face>& polygons);
		};

	}

}