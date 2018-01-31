#pragma once

#include <vector>
#include <opencv2/opencv.hpp>
#include "Building.h"

namespace lego {

	void write(char* filename, const std::vector<Building>& buildings);

}