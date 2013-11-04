#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define ELEM_SEPARATOR '.'
#define PREREL_SEPARATOR '-'
#define BUILD_SEPARATOR '+'

struct version_elem {
	bool is_numeric;
	char *raw;
	long int num;

	struct version_elem *next;
};

typedef struct version_elem version_elem;

typedef struct {
	version_elem *main;
	version_elem *prerel;
} version;

int compare_version_elems (version_elem *elem1, version_elem *elem2);
int compare_version_components (version_elem *ver1, version_elem *ver2);
version *parse_version_string (char *str);
version_elem *parse_version_component (char *str);

int main (int argc, char **argv) {
	if (argc != 3) {
		fprintf(stderr, "Please provide exactly two version strings as arguments.\n");
		exit(EXIT_FAILURE);
	}

	version *ver1 = parse_version_string(argv[1]);
	version *ver2 = parse_version_string(argv[2]);

	int result;
	result = compare_version_components(ver1->main, ver2->main);
	if (result == 0) {
		if (ver1->prerel == NULL && ver2->prerel == NULL) {
			result = 0;
		} else if (ver1->prerel == NULL) {
			result = 1;
		} else if (ver2->prerel == NULL) {
			result = -1;
		} else {
			result = compare_version_components(ver1->prerel, ver2->prerel);
		}
	}

	if (result < 0) {
		result = -1;
	} else if (result > 0) {
		result = 1;
	}

	printf("%d\n", result);
	return EXIT_SUCCESS;
}

int compare_version_elems (version_elem *elem1, version_elem *elem2) {
	if (elem1 == NULL && elem2 == NULL) {
		return 0;
	} else if (elem1 == NULL) {
		return -1;
	} else if (elem2 == NULL) {
		return 1;
	}

	if (elem1->is_numeric && elem2->is_numeric) {
		return (elem1->num < elem2->num) ? -1 : (elem1->num > elem2->num);
	} else {
		return strcmp(elem1->raw, elem2->raw);
	}
}

int compare_version_components (version_elem *ver1, version_elem *ver2) {
	int result = 0;
	while (ver1 != NULL || ver2 != NULL) {
		result = compare_version_elems(ver1, ver2);
		if (result != 0)
			break;

		ver1 = ver1->next;
		ver2 = ver2->next;
	}

	return result;
}

version *parse_version_string (char *str) {
	version *parsed = malloc(sizeof(version));
	char *separator;

	if (separator = strchr(str, BUILD_SEPARATOR))
		*separator = '\0';

	separator = strchr(str, PREREL_SEPARATOR);
	if (separator != NULL) {
		*separator = '\0';
		parsed->prerel = parse_version_component(separator + 1);
	} else {
		parsed->prerel = NULL;
	}

	parsed->main = parse_version_component(str);

	return parsed;
}

version_elem *parse_version_component (char *str) {
	char *separator = strchr(str, ELEM_SEPARATOR);
	version_elem *parsed = malloc(sizeof(version_elem));

	if (separator != NULL)
		*separator = '\0';

	parsed->raw = str;

	char *endptr = NULL;
	parsed->num = strtol(str, &endptr, 10);
	parsed->is_numeric = (*endptr == '\0');

	if (separator == NULL) {
		parsed->next = NULL;
	} else {
		parsed->next = parse_version_component(separator + 1);
	}

	return parsed;
}

