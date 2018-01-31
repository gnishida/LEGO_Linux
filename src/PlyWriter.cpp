#include "PlyWriter.h"
#include <fstream>

namespace lego {

	void write(char* filename, const std::vector<Building>& buildings) {
		std::ofstream out(filename);

		// count the number of vertices and faces
		std::vector<cv::Point3f> points;
		for (int i = 0; i < buildings.size(); i++) {
			//buildings[i].
		}

		out.close();
	}

}